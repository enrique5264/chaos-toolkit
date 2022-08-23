# chaos-toolkit
Build:
```
docker build -t chaos-engine .
```
Run:
```
docker run -v $PWD/projects:/projects --env PYTHONPATH=$PWD/projects:/projects --env AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID> --env AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY> chaos-engine --no-log-file run <path/to/experiment.json>
```