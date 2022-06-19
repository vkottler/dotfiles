#requires -version 4.0
#requires -runasadministrator

# languages and tools
choco upgrade -y rust python

# music dev
choco upgrade -y audacity bitwig

# video dev
choco upgrade -y obs-studio screentogif carnac drawio

choco list -localonly
