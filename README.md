# metadiff
![CI](https://github.com/ScottG489/metadiff/workflows/CI/badge.svg)

Command line tool for extracting metadata from a unified diff

## Usage
### Docker

Pass the raw text *(see below for an example of this assignment)* of the diff to the container:
```shell
docker run scottg489/metadiff:latest "$DIFF_INPUT"
```

## Development

Install and run the app locally:
```shell
./gradlew install
./build/install/metadiff/bin/metadiff "$DIFF_INPUT"
```

## Misc
Assign the raw text of a diff to a variable:
```shell
read -r -d '' DIFF_INPUT << EOM
diff --git a/src/App.tsx b/src/App.tsx
index f90989a..591f8d1 100644
--- a/src/App.tsx
+++ b/src/App.tsx
@@ -52,7 +52,7 @@ const App = () => {
async function fetchDiffInfo (postData: string) {
try {
const response = await fetch(
-        'https://api.conjob.io/job/run?image=scottg489/diff-info:latest',
+        'https://api.conjob.io/job/run?image=scottg489/metadiff:latest',
         {
           method: 'POST',
           body: postData,
EOM
```
This can then be used to pass it to the container or application.