#!/bin/bash

# blockchain-account-wallet-create


# Include file with paths configs
paths_conf="./configs/paths.conf"
. ${paths_conf}


# Set `pWalletName` from 1st parameter
pWalletName=${1}

# Use .`wp` as extension for a file to storage `Blockchain Account Wallet's password`
pWalletPasswordFileExtension="wp"


# Check: Already exists error
if [ ! -f ${pWalletPasswordFileDir}/${pWalletName}.${pWalletPasswordFileExtension} ];
  then
    # Create new `Blockchain Account Wallet`,
    # Generate `Blockchain Account Wallet's password` and
    # Store `Blockchain Account Wallet's password` to specific file.
    cleos \
      --wallet-url=${pWalletSocketUrl} \
      wallet \
          create \
          --name=${pWalletName} \
          --file=${pWalletPasswordFileDir}/${pWalletName}.${pWalletPasswordFileExtension}
fi



# Get `Blockchain Account Wallet Password`

## Set Permissions
pscriptLinuxUserPermissionsSet="../linux-user-permissions-set/index.sh"
sh ${pscriptLinuxUserPermissionsSet}

## Output
pWalletPasswordString=`cat ${pWalletPasswordFileDir}/${pWalletName}.${pWalletPasswordFileExtension}`
echo -e "Blockchain Account Wallet's Password is:"
echo -e ${pWalletPasswordString}
echo -e "\n"


# Do Unlock for a `Blockchain Account Wallet`
cleos \
  --wallet-url=${pWalletSocketUrl} \
  wallet \
    unlock \
      --name=${pWalletName} \
      --password=${pWalletPasswordString}



# Use .`keypair` as extension for a file to storage `Blockhain Account Permission Key Pair`
pAccountPermissionKeyPairFileExtension="keypair"


# Generate KeyPair for `Blockchain Account Permission` `Active`
pKeyPairArrayActive=(`cleos \
                        --wallet-url=${pWalletSocketUrl} \
                        create \
                          key \
                            --to-console`)
pPrivateKeyActive=${pKeyPairArrayActive[2]}
pPublicKeyActive=${pKeyPairArrayActive[5]}

# Check: Already exists error
if [ ! -f "${pAccountPermissionKeyPairAbsoluteDirectoryPath}/${pWalletName}.${pAccountPermissionKeyPairFileExtension}" ]; then
  # Save keys into file
  echo \
    -e \
    ${pPrivateKeyActive}\n${pPublicKeyActive} >> ${pAccountPermissionKeyPairAbsoluteDirectoryPath}/${pWalletName}.${pAccountPermissionKeyPairFileExtension}
fi

#Add Active private key into the wallet
cleos \
  --wallet-url=${pWalletSocketUrl} \
  wallet \
    import \
      --name=${pWalletName} \
      --private-key=${pPrivateKeyActive}



# Generate KeyPair for `Blockchain Account Permission `Owner`
pKeyPairArrayOwner=(`cleos \
                        --wallet-url=${pWalletSocketUrl} \
                        create \
                          key \
                            --to-console`)
pPrivateKeyOwner=${pKeyPairArrayOwner[2]}
pPublicKeyOwner=${pKeyPairArrayOwner[5]}

# Check: Already exists error
if [ ! -f "${pAccountPermissionKeyPairAbsoluteDirectoryPath}/${pWalletName}.${pAccountPermissionKeyPairFileExtension}" ]; then
  # Save keys into file
  echo \
    -e \
    "${pPrivateKeyOwner}\n${pPublicKeyOwner}" >> ${pAccountPermissionKeyPairAbsoluteDirectoryPath}/${pWalletName}.${pAccountPermissionKeyPairFileExtension}
fi

#Add Owner private key into the wallet
cleos \
  --wallet-url=${pWalletSocketUrl} \
  wallet \
    import \
      --name=${pWalletName} \
      --private-key=${pPrivateKeyOwner}