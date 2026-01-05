#27 DONE 0.2s

#28 [fe-builder 9/9] RUN pnpm -C frontend build
#28 1.493
#28 1.493 > vibe-kanban@0.0.143 build /repo/frontend
#28 1.493 > tsc && vite build
#28 1.493
#28 39.35 vite v5.4.19 building for production...
#28 39.47 [sentry-vite-plugin] Info: Sending telemetry data on issues and performance to Sentry. To disable telemetry, set `options.telemetry` to `false`.
#28 40.84 transforming...
#28 45.75 Browserslist: browsers data (caniuse-lite) is 8 months old. Please run:
#28 45.75   npx update-browserslist-db@latest
#28 45.75   Why you should do it regularly: https://github.com/browserslist/update-db#readme

#28 80.21 ✓ 4330 modules transformed.
#28 94.55 rendering chunks...
#28 124.7
#28 124.7 <--- Last few GCs --->
#28 124.7
#28 124.7 [17:0x725d246e8660]    84665 ms: Scavenge 2014.1 (2073.5) -> 2013.4 (2083.0) MB, 54.87 / 0.00 ms  (average mu = 0.628, current mu = 0.719) allocation failure;
#28 124.7 [17:0x725d246e8660]    84752 ms: Scavenge 2020.3 (2083.3) -> 2018.2 (2084.1) MB, 22.33 / 0.00 ms  (average mu = 0.628, current mu = 0.719) allocation failure;
#28 124.7 [17:0x725d246e8660]    87311 ms: Scavenge 2021.6 (2084.3) -> 2020.0 (2103.0) MB, 2524.34 / 0.00 ms  (average mu = 0.628, current mu = 0.719) allocation failure;
#28 124.7
#28 124.7
#28 124.7 <--- JS stacktrace --->
#28 124.7
#28 124.7 FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
#28 124.7 ----- Native stack trace -----
#28 124.7
#28 143.2  ELIFECYCLE  Command failed.
#28 ERROR: process "/bin/sh -c pnpm -C frontend build" did not complete successfully: exit code: 1
------
 > [fe-builder 9/9] RUN pnpm -C frontend build:
124.7 [17:0x725d246e8660]    84752 ms: Scavenge 2020.3 (2083.3) -> 2018.2 (2084.1) MB, 22.33 / 0.00 ms  (average mu = 0.628, current mu = 0.719) allocation failure;
124.7 [17:0x725d246e8660]    87311 ms: Scavenge 2021.6 (2084.3) -> 2020.0 (2103.0) MB, 2524.34 / 0.00 ms  (average mu = 0.628, current mu = 0.719) allocation failure;
124.7
124.7
124.7 <--- JS stacktrace --->
124.7
124.7 FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
124.7 ----- Native stack trace -----
124.7
143.2  ELIFECYCLE  Command failed.
------
Dockerfile:19

--------------------

  17 |     COPY frontend/ frontend/

  18 |     COPY shared/ shared/

  19 | >>> RUN pnpm -C frontend build

  20 |

  21 |     # Stage 2: Backend Builder

--------------------

failed to solve: process "/bin/sh -c pnpm -C frontend build" did not complete successfully: exit code: 1
