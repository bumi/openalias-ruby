#[macro_use]
extern crate ruru;
extern crate openalias;

use ruru::{Array, Hash, Class, Boolean, Object, RString, Symbol};

class!(Openalias);

methods!(
    Openalias,
    _itself,
    
    fn addresses(address: RString) -> Array {
      let mut cryptoaddresses = Array::new();
      match openalias::addresses(&address.unwrap().to_string()) {
        Ok(cas) => {
            for c in cas {
                let mut cryptoaddress = Hash::new();
                cryptoaddress.store(Symbol::new("cryptocurrency"), RString::new(&c.cryptocurrency));
                cryptoaddress.store(Symbol::new("address"), RString::new(&c.address));
                if let Some(recipient_name) = c.recipient_name.as_ref() {
                    cryptoaddress.store(Symbol::new("recipient_name"), RString::new(recipient_name));
                }
                if let Some(tx_description) = c.tx_description.as_ref() {
                    cryptoaddress.store(Symbol::new("tx_description"), RString::new(tx_description));
                }
                if let Some(tx_amount) = c.tx_amount.as_ref() {
                    cryptoaddress.store(Symbol::new("tx_amount"), RString::new(tx_amount));
                }
                if let Some(tx_payment_id) = c.tx_payment_id.as_ref() {
                    cryptoaddress.store(Symbol::new("tx_payment_id"), RString::new(tx_payment_id));
                }
                if let Some(address_signature) = c.address_signature.as_ref() {
                    cryptoaddress.store(Symbol::new("address_signature"), RString::new(address_signature));
                }
                if let Some(&(_, checksum_ok)) = c.checksum.as_ref() {
                    cryptoaddress.store(Symbol::new("checksum"), Boolean::new(checksum_ok));
                }
                for (key, val) in &c.additional_values {
                    cryptoaddress.store(Symbol::new(key), RString::new(val));
                }
                
                let ca = Class::from_existing("Openalias").get_nested_class("CryptoAddress").new_instance(vec![cryptoaddress.to_any_object()]);
                cryptoaddresses.push(ca);
            }
           return cryptoaddresses;
        }
        Err(_cas) => {
            return cryptoaddresses;
        }
      }
    }
);

#[no_mangle]
pub extern fn init_openalias_rust() {
    Class::from_existing("Openalias").define(|itself| {
    //Class::new("OpenaliasRust", None).define(|itself| {
        itself.def_self("addresses", addresses);
    });
}
