pragma solidity ^0.4.11;

contract TestOOG {
    /// Allowed transaction types mask
    uint32 constant None = 0;
    uint32 constant All = 0xffffffff;
    uint32 constant Basic = 0x01;
    uint32 constant Call = 0x02;
    uint32 constant Create = 0x04;
    uint32 constant Private = 0x08;

    function allowedTxTypes(address sender) public returns (uint32)
    {
        if (sender == 0x4a2667B4340Cf180eB832e6C623F1eC27E88e33d) return All; // Secret: 0x00..01
        if (sender == 0xC7572bf6A8Ad93Daf61aF35F7546B4BADCD7f692) return Basic | Call; // Secret: 0x00..02
        if (sender == 0x6813Eb9362372EEF6200f3b1dbC3f819671cBA69) return Basic; // Secret: 0x00..03
        return None;
    }
}
