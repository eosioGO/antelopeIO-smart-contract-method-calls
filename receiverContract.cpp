#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("receiverContract")]] receiverContract : public eosio::contract {
  public:

    receiverContract(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}


    [[eosio::action]]
    void printtext() 
    {
        print("fffffffffffffffffffffffff");
    }

    using count_action123 = action_wrapper<"printtext"_n, &receiverContract::printtext>;

};