ovn:
	docker build -t openbce/kvn:0.3.0 -f Dockerfile.ovn .

cni:
	docker build -t openbce/cni:v1.1.1 -f Dockerfile.cni .
