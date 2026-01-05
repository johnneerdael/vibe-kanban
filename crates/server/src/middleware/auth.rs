use axum::{
    extract::Request,
    http::{StatusCode, header},
    middleware::Next,
    response::Response,
};
use base64::{Engine as _, engine::general_purpose};

pub async fn basic_auth(req: Request, next: Next) -> Result<Response, StatusCode> {
    let auth_user = std::env::var("AUTH_USER").ok();
    let auth_pass = std::env::var("AUTH_PASS").ok();

    // If no auth is configured, allow all requests
    if auth_user.is_none() || auth_pass.is_none() {
        return Ok(next.run(req).await);
    }

    let auth_header = req
        .headers()
        .get(header::AUTHORIZATION)
        .and_then(|h| h.to_str().ok());

    if let Some(auth_header) = auth_header {
        if auth_header.starts_with("Basic ") {
            let encoded = &auth_header[6..];
            if let Ok(decoded) = general_purpose::STANDARD.decode(encoded) {
                if let Ok(decoded_str) = String::from_utf8(decoded) {
                    if let Some((user, pass)) = decoded_str.split_once(':') {
                        if Some(user) == auth_user.as_deref() && Some(pass) == auth_pass.as_deref() {
                            return Ok(next.run(req).await);
                        }
                    }
                }
            }
        }
    }

    let mut response = Response::builder()
        .status(StatusCode::UNAUTHORIZED)
        .body(axum::body::Body::empty())
        .unwrap();

    response.headers_mut().insert(
        header::WWW_AUTHENTICATE,
        header::HeaderValue::from_static("Basic realm=\"Vibe Kanban\""),
    );

    Ok(response)
}