terraform:
	docker run -it \
		--entrypoint="" \
		--network="host" \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SECRET_ACCESS_KEY \
		-e AWS_SESSION_TOKEN \
		-v $(PWD):/workspace \
		-w /workspace/infra/deployment/terraform \
		hashicorp/terraform:0.12.5 /bin/sh
