# Sourcegraph Dart LSIF Indexer GitHub Action

This action generate LSIF data from Dart source code. See the [LSIF Dart indexer](https://github.com/sourcegraph/lsif-dart) for more details.

## Usage

The following inputs can be set.

| name         | default   | description |
| ------------ | --------- | ----------- |
| file         | dump.lsif | The output file (relative to the repository root). |
| project_root | `.`       | The root of the project (where crossdart is invoked). |

The following is a complete example that uses the [upload action](https://github.com/sourcegraph/lsif-upload-action) to upload the generated data to [sourcegraph.com](https://sourcegraph.com). Put this in `.github/workflows/lsif.yaml`.

```
name: LSIF
on:
  - push
jobs:
  index:
    runs-on: ubuntu-latest
    container: google/dart:2.7
    steps:
      - uses: actions/checkout@v1
      - name: Install dependencies
        run: pub get
      - name: Generate LSIF data
        uses: sourcegraph/lsif-dart-action@master
      - name: Upload LSIF data
        uses: sourcegraph/lsif-upload-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```
