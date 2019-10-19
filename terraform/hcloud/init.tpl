#cloud-config
# vim: syntax=yaml
hostname: master
package_update: true
package_upgrade: true
package_reboot_if_required: true
write_files:
- content: |
    auto eth0:1
    iface eth0:1 inet static
        address ${floating_ip}
        netmask 32
  path: /etc/network/interfaces.d/60-my-floating-ip.cfg
runcmd:
- 'service networking restart'
- 'curl -sfL https://get.k3s.io | sh -'
