# outputs.tf
output "vm1_public_ip" {
  value = module.vm1.vm_public_ip
}

output "vm2_public_ip" {
  value = module.vm2.vm_public_ip
}
