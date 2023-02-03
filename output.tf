output "info" {
  value = aws_vpc.example.owner_id

}
output "azs" {
  value = data.aws_availability_zones.available
}