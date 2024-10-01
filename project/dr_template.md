# Infrastructure

## AWS Zones
Zone 1 : US-EAST-2
Zone 2 : US-WEST-1

## Servers and Clusters

### Table 1.1 Summary
| Asset             | Purpose               | Size        | Qty   | DR                                                      |
|------------       |-------------------    |-------------|-------|---------------------------------------------------------|
| VPC               | Virtual Network       | -           |   2   | 2 zones, 1 VPC each zone for DR purpose                 |
| EC2 instances     | Application Servers   | t3.micro    |   6   | 2 zones, 3 instances each zone for DR purpose           |
| EC2 keypair       | SSH key for access EC2| -           |   2   | 2 zones, 1 keypair each zone for DR purpose             |
| EKS               | Kubernetes Clusters   | t3.medium   |   4   | 2 zones, 2 nodes each zone for DR purpose               |
| Prometheus Grafana| Monitoring System     | -           |   2   | 2 zones, 2 nodes each zone for DR purpose               |
| S3 bucket         | Bucket for terraform  | -           |   2   | 2 zones, 1 bucket each zone for DR purpose              |
| ALB               | App Load balancer     | -           |   2   | For HA/DR purpose                                       |
| RDS               | Backend Database      | db.t3.micro |   2   | 1 cluster 2 node on zone 1                              |
| RDS               | Backend Database      | db.t3.micro |   2   | 1 cluster 2 node replicated from zone 1 to zone 2       |

### Descriptions
- VPC:  Virtual Private Compute - Networking for cloud infrastructure
- EC2 instances:  Virtual Machine to running application
- EC2 keypair:  SSH key for access EC2 instances
- EKS: Kubernetes cluster for running prometheus and grafana
- Prometheus Grafana: Monitoring stack to monitor application
- S3 bucket: Store terraform state
- ALB: Network load balancing for HA/DR purpose
- RDS: SQL database cluster for storing data of application

## DR Plan
### Pre-Steps:
- Ensure DR site setting and working properly
- 
## Steps:
- Database: Promote replicated cluster RDS on DR site
- Traffic: Reroute traffic to DR site
