output "aws_vpc_cidr" {
  value       = data.aws_vpc.aws_vpc.cidr_block
  description = "AWS VPC CIDR"
}

output "aws_vpn_ip" {
  value       = aws_vpn_connection.aws_vpn_cnx.tunnel1_address
  description = "AWS VPN IP"
}

output "gcp_subnets_cidr" {
  value = [
    for adr in data.google_compute_subnetwork.gcp_subnets : adr.ip_cidr_range
  ]
  description = "GCP Subnets CIDR"
}

output "gcp_vpn_ip" {
  value       = google_compute_address.gcp_vpn_ip.address
  description = "GCP VPN IP"
}
