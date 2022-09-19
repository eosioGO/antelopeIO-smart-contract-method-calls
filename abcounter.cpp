#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("abcounter")]] abcounter : public eosio::contract {
  public:

    abcounter(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}

    [[eosio::action]]
    void say(name user, std::string type) {
      require_auth( name("addressbook"));
      print("[abcounter] say ");
    }

    using count_action = action_wrapper<"say"_n, &abcounter::say>;

};

Private key: 5JveVE3JpjbpCYHuBWVwsGtKBWA2E2JRd6Hj9YuUg5iYrkR9niC
Public key: EOS8YaJTCKat1ZYR6RnKbGxZqN6M2feepp1Lx8WhL1cu2FE6LfbE1

Private key: 5KYePhiy8szi9fFFfaFfEwMk8hvZTtW8GHofU8tLCUUNawp4wyp
Public key: EOS7oTdCMCpN8T7Mvu6vZdp328eCCPg4t1CtXqFcuWyY19Z8f568N
