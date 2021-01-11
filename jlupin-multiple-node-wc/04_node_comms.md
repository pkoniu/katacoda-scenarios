# Enabling communication between the nodes

NODE_1:
`/opt/jlupin/platform/start/control.sh node peer add NODE_2 localhost 19090 19095 19096 19097`{{execute}}

NODE_2:
`/opt/jlupin/platform2/start/control.sh node peer add NODE_1 localhost`{{execute}}
