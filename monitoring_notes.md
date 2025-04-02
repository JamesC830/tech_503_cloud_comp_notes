# Monitoring notes

### Setting up a dashboard

Start in instance summary:

- Scroll down to monitoring
- Click manage detailed monitoring and select enable
- Click add to dashboard
- Click create new (name scheme: tech503-james-app-dashboard)
- Make sure the refresh time is set to 1 minute (too fast and it costs more money)
  

### Setting up CPU usage alarm

- Navigate to the [Cloudwatch](https://eu-west-1.console.aws.amazon.com/cloudwatch/home?region=eu-west-1#home:) page
- Click create alarms
- Set metric
- Select EC2 per instance metrics
- Filter for your instance ID and CPUUtilization
- Select the metric
- Define threshold value (its a percentage of the CPU usage)
- Click next
- Click create new topic
- Add name and email for it to be sent to
- Click create topic
- Confirm your subscription through your email

### Generating stress

We will do this by installing stress-ng

Run the below to test at a load of 80%

```
sudo apt update

sudo apt install stress-ng

stress-ng --cpu 4 --cpu-load 80 --timeout 180s
```

- You should recieve an email eventually