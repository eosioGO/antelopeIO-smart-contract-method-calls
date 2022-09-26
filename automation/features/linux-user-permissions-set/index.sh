#!/bin/bash

# linux-user-permissions-set

pUser=${USER}
pUserGroup=${pUser}
pFile=${pWalletPasswordFileDir}/${pWalletName}.${pWalletPasswordFileExtension}

sudo 
  chown \
    ${pUser}}:${pUserGroup} \
    ${pFile}

sudo 
  chmod \
    666 \
    ${pFile}

echo \
  -e \
  "\n"
