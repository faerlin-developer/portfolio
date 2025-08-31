# GitHub Deployment

1. In `Settings` -> `Pages`
   - Set `Source` to `Deploy from a branch`
   - Set `Branch` to `main` and `/ (root)`
  
2. Create `.github/workflows/ci.yml`:
    ```yaml
    name: ci
    on:
    push:
        branches:
        - master
        - main
    permissions:
    contents: write
    jobs:
    deploy:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v4
        - name: Configure Git Credentials
            run: |
            git config user.name github-actions[bot]
            git config user.email 41898282+github-actions[bot]@users.noreply.github.com
        - uses: actions/setup-python@v5
            with:
            python-version: 3.x
        - run: echo "cache_id=$(date --utc '+%V')" >> $GITHUB_ENV
        - uses: actions/cache@v4
            with:
            key: mkdocs-material-${{ env.cache_id }}
            path: ~/.cache
            restore-keys: |
                mkdocs-material-
        - run: pip install -r requirements.txt
        - name: Deploy with MkDocs
            env:
            GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            run: mkdocs gh-deploy --force --remote-branch gh-pages
    ```

3. Push changes to remote repository
   This will trigger the GitHub action creating the `gh-pages` branch.
   
4. In `Settings` -> `Pages` set `Branch` to `gh-pages` and `/ (root)`
   
5. Trigger the GitHub action by `git commit --allow-empty -m "trigger GitHub action"` and `git push`.

6. Website should now be deployed.
