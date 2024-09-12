cd ..
sudo yum install -y wget
wget https://github.com/prometheus/cloudwatch_exporter/archive/refs/tags/v0.16.0.tar.gz
tar -xzf v0.16.0.tar.gz
cat << EOF > cloudwatch_exporter_config.yml
region: eu-west-1
metrics:
  # ECS Cluster Metrics
  - aws_namespace: AWS/ECS
    aws_metric_name: CPUUtilization
    aws_dimensions: [ClusterName]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: MemoryUtilization
    aws_dimensions: [ClusterName]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: RunningTasksCount
    aws_dimensions: [ClusterName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: PendingTasksCount
    aws_dimensions: [ClusterName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ActiveServicesCount
    aws_dimensions: [ClusterName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: DesiredTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: RunningTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: PendingTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServiceCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServiceRunningTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServicePendingTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: CPUReservation
    aws_dimensions: [ClusterName]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: MemoryReservation
    aws_dimensions: [ClusterName]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ContainerInstanceCount
    aws_dimensions: [ClusterName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: TaskCount
    aws_dimensions: [ClusterName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServiceTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  # ECS Service Metrics
  - aws_namespace: AWS/ECS
    aws_metric_name: CPUUtilization
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: MemoryUtilization
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServiceCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServiceRunningTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: ServicePendingTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: DesiredTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: RunningTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  - aws_namespace: AWS/ECS
    aws_metric_name: PendingTaskCount
    aws_dimensions: [ClusterName, ServiceName]
    aws_statistics: [Sum]

  # ECS Task Metrics
  - aws_namespace: AWS/ECS
    aws_metric_name: CPUUtilization
    aws_dimensions: [ClusterName, TaskDefinitionFamily]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: MemoryUtilization
    aws_dimensions: [ClusterName, TaskDefinitionFamily]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/ECS
    aws_metric_name: TaskCount
    aws_dimensions: [ClusterName, TaskDefinitionFamily]
    aws_statistics: [Sum]
  # EC2 Instance Metrics
  - aws_namespace: AWS/EC2
    aws_metric_name: CPUUtilization
    aws_dimensions: [InstanceId]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/EC2
    aws_metric_name: DiskReadOps
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: DiskWriteOps
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: DiskReadBytes
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: DiskWriteBytes
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: NetworkIn
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: NetworkOut
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: StatusCheckFailed
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: StatusCheckFailed_Instance
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: StatusCheckFailed_System
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: MemoryUtilization
    aws_dimensions: [InstanceId]
    aws_statistics: [Average, Maximum, Minimum]

  - aws_namespace: AWS/EC2
    aws_metric_name: NetworkPacketsIn
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: NetworkPacketsOut
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: VolumeReadOps
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: VolumeWriteOps
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: VolumeReadBytes
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: VolumeWriteBytes
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: CPUCreditBalance
    aws_dimensions: [InstanceId]
    aws_statistics: [Average]

  - aws_namespace: AWS/EC2
    aws_metric_name: CPUSurplusCredits
    aws_dimensions: [InstanceId]
    aws_statistics: [Average]

  - aws_namespace: AWS/EC2
    aws_metric_name: CPUCreditUsage
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: CPUCreditsCharged
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: EC2InstanceStatus
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: EC2InstanceState
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: NetworkPacketsIn
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]

  - aws_namespace: AWS/EC2
    aws_metric_name: NetworkPacketsOut
    aws_dimensions: [InstanceId]
    aws_statistics: [Sum]
EOF
sudo amazon-linux-extras install java-openjdk11
java -version
wget https://github.com/prometheus/cloudwatch_exporter/releases/download/v0.16.0/cloudwatch_exporter-0.16.0-jar-with-dependencies.jar
nohup java -jar cloudwatch_exporter-0.16.0-jar-with-dependencies.jar 9106 cloudwatch_exporter_config.yml &
sudo netstat -tuln | grep 9106
cd ..

wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 -O cadvisor
chmod +x cadvisor
nohup ./cadvisor > cadvisor.log 2>&1 &
sudo netstat -tuln | grep 8080

wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
tar -xzf node_exporter-1.8.2.linux-amd64.tar.gz
cd node_exporter-1.8.2.linux-amd64
nohup ./node_exporter > node_exporter.log 2>&1 &
sudo netstat -tuln | grep 9100
cd ..

wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar xvf prometheus-2.43.0.linux-amd64.tar.gz
cd prometheus-2.43.0.linux-amd64
cat > prometheus.yml <<EOL
global:
  scrape_interval: 15s
  evaluation_interval: 15s
scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["44.203.33.143:9091"]

  - job_name: "cloudwatch_exporter"
    static_configs:
      - targets: ["44.203.33.143:9106"]

  - job_name: 'cadvisor'
    static_configs:
      - targets: ['44.203.33.143:8080']

  - job_name: 'node_exporter'
    static_configs:
      - targets: ['44.203.33.143:9100']
EOL
nohup ./prometheus --config.file=prometheus.yml --web.listen-address=:9091 > prometheus.log 2>&1 &
netstat -tuln | grep 9091