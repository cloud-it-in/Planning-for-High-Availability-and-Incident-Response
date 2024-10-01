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
## Steps: Below steps should be the best practices for successfully deploying a DR Plan and DR Deployment.
1. Plan Your DR Strategy
Define RTO and RPO: Determine your Recovery Time Objective (RTO) and Recovery Point Objective (RPO) to understand the acceptable downtime and data loss.
Choose a DR Strategy: Decide on a suitable DR strategy such as Backup and Restore, Pilot Light, Warm Standby, or Multi-Site Active/Active1.

3. Set Up the Secondary Region
Create a Secondary AWS Environment: Replicate your primary region’s infrastructure in the secondary region using Infrastructure as Code (IaC) tools like AWS CloudFormation or Terraform.
Configure Networking: Set up VPCs, subnets, security groups, and other networking components in the secondary region.

5. Data Replication
Database Replication: Use Amazon RDS Cross-Region Read Replicas or other database replication methods to keep your data synchronized between regions.
S3 Replication: Enable cross-region replication for your S3 buckets to ensure data is copied to the secondary region.

7. Deploy Applications
Deploy Application Code: Use CI/CD pipelines to deploy your application code to the secondary region.
Synchronize Configurations: Ensure that all configurations, environment variables, and secrets are synchronized between regions.

9. Set Up Monitoring and Alerts
Monitoring Tools: Deploy monitoring tools like CloudWatch, Grafana, and Prometheus in the secondary region to monitor the health and performance of your applications.
Alerts: Configure alerts to notify your team of any issues in the secondary region.

11. Test the DR Plan
Failover Testing: Regularly test your failover process to ensure that your applications can be quickly and reliably switched to the secondary region.
Simulate Disasters: Conduct simulated disaster scenarios to validate your DR plan and make necessary adjustments.

13. Automate Failover
Automate Failover Processes: Use automation tools to streamline the failover process. AWS Route 53 can be used to manage DNS failover.
Update Routing: Ensure that your DNS and load balancers are configured to route traffic to the secondary region during a failover event.

15. Documentation and Training
Document the DR Plan: Maintain detailed documentation of your DR plan, including step-by-step procedures and contact information.
Train Your Team: Regularly train your team on the DR procedures to ensure they are prepared to execute the plan effectively.

17. Review and Improve
Regular Reviews: Periodically review and update your DR plan to incorporate new technologies and address any gaps identified during testing.
Continuous Improvement: Implement lessons learned from tests and real incidents to continuously improve your DR strategy.
