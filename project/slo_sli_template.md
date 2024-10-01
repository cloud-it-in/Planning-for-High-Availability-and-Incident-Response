# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|---------------------|-------------------------------------------------------------------------------------------------------------|
| Availability |Total number of successful requests / Total number of requests| 99%                                                                                                         |
| Latency      |Buckets of requests in a histogram showing the 90th percentile| 90% of requests below 100ms                                                                                 |
| Error Budget |Percentage of the number of error requests/total number of requests in budget.| Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |Total number of successful requests| 5 RPS indicates the application is functioning                                                              |
