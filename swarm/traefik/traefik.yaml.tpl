# vim: set ft=yaml:

global:
  checkNewVersion: true
  sendAnonymousUsage: true

log:
  level: INFO

entryPoints:
  http:
    address: ":80"
    http:
      redirections:
        entryPoint:
          to: https
  https:
    address: ":443"
    forwardedHeaders:
      trustedIPs:
        - 173.245.48.0/20
        - 103.21.244.0/22
        - 103.22.200.0/22
        - 103.31.4.0/22
        - 141.101.64.0/18
        - 108.162.192.0/18
        - 190.93.240.0/20
        - 188.114.96.0/20
        - 197.234.240.0/22
        - 198.41.128.0/17
        - 162.158.0.0/15
        - 104.16.0.0/12
        - 172.64.0.0/13
        - 131.0.72.0/22
  taskd:
    address: ":53589"

api:
  dashboard: true

accessLog:
  filePath: /logs/traefik.log
  bufferingSize: 100

providers:
  docker:
    swarmMode: true
    exposedByDefault: false
    network: ${NET_NAME}
  file:
    directory: /rules

certificatesResolvers:
  dns-cloudflare:
    acme:
      email: ${ACME_EMAIL}
      storage: /acme2.json
      #storage: /acme2-test.json
      #caServer: "https://acme-staging-v02.api.letsencrypt.org/directory" # For testing purposes
      dnsChallenge:
        provider: cloudflare
        resolvers:
          - "1.1.1.1:53"
          - "1.0.0.1:53"
        delayBeforeCheck: 90

