ECR_REGISTRY="SEU_REGISTRY"
-- PRE_BUILD
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
-- BUILD
docker build -t bia .
docker tag bia:latest $ECR_REGISTRY/bia:latest
-- POST BUILD
docker push $ECR_REGISTRY/bia:latest
