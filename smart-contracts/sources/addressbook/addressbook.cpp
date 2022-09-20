#include <eosio/eosio.hpp>
#include "../abcounter/abcounter.cpp"

using namespace eosio;

class [[eosio::contract("addressbook")]] addressbook : public eosio::contract {

public:

  addressbook(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}

  [[eosio::action]]
  void printer(name user) {
    increment_counter(user, "[addressbook] printer ");
  }

private:

  void increment_counter(name user, std::string type) {
    abcounter::count_action count("abcounter"_n, {get_self(), "active"_n});
    count.send(user, type);
  }

};