#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("abcounter")]] abcounter : public eosio::contract {
  public:

    abcounter(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}

    [[eosio::action]]
    void say(name user, std::string type) {
      print("[abcounter] say ");
    }

    using count_action = action_wrapper<"say"_n, &abcounter::say>;

};