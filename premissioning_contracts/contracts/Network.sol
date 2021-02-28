pragma solidity ^0.4.11;

contract PeerManager {
    struct PeerInfo {
        bytes32 public_low;
        bytes32 public_high;
    }

    mapping(uint => PeerInfo) peers;

    bool[5][5] allowedConnections;


    function PeerManager() {
        peers[0] = PeerInfo(0x35d06958e17fdedbd221e78064525a258e1ba8d0a32d76b449b16c1cb0c5b945, 0x87b1b6aec5ff09f9061985dd4125ed79da4cb300cf03f77c1320025ac33f660e);
        peers[1] = PeerInfo(0x020c03b935a1654f24746528166c2146dd54b1eb7dce1e3607d734ea59806379, 0x0ca9d6873af052602fcd359e94dba7d4cf4489a5508653a7bfeff454a0592f11);
        peers[2] = PeerInfo(0xf45a41fbe21da1bdedc41e7fe0aea9f1019ea6e23b3b89c9a5aebe3cff41fae8, 0xcd24d1685f079eb767d0ed5c5a278089bf9c89a242fcc199cc4303b8acdae934);
        peers[3] = PeerInfo(0x8f20c8167b148e2bd2837e8381e814e9f2c5de07552ebdee6f5a881eb89ca619, 0x7bb61cacb2d3e1ad5f5f7a89c58c28f5d13b1c988c9758edb57afe3b9c4d2212);
        peers[4] = PeerInfo(0x6a3c14ff9ece32d3cdd7be7a1c666ed6569f0e7365be6a443d65c579653019a0, 0xda044be3a1067d062521bb1131037686f8d872ae167a1437dfe0412673f9dbc1);

        allowedConnections[0][0] = true;
        allowedConnections[0][1] = true;
        allowedConnections[0][2] = true;
        allowedConnections[0][3] = true;
        allowedConnections[0][4] = true;
        allowedConnections[1][0] = true;
        allowedConnections[1][1] = true;
        allowedConnections[1][2] = true;
        allowedConnections[1][3] = true;
        allowedConnections[1][4] = true;
        allowedConnections[2][0] = true;
        allowedConnections[2][1] = true;
        allowedConnections[2][2] = true;
        allowedConnections[2][3] = false;
        allowedConnections[2][4] = true;
        allowedConnections[3][0] = true;
        allowedConnections[3][1] = true;
        allowedConnections[3][2] = false;
        allowedConnections[3][3] = true;
        allowedConnections[3][4] = false;
        allowedConnections[4][0] = true;
        allowedConnections[4][1] = true;
        allowedConnections[4][2] = true;
        allowedConnections[4][3] = false;
        allowedConnections[4][4] = true;
    }

    function connectionAllowed(bytes32 sl, bytes32 sh, bytes32 pl, bytes32 ph) constant returns (bool res) {
        uint index1 = 0;
        bool index1_found = false;
        uint index2 = 0;
        bool index2_found = false;
        for (uint i = 0; i < 5; i++) {
            PeerInfo storage peer = peers[i];

            if (sh == peer.public_high && sl == peer.public_low) {
                index1 = i;
                index1_found = true;
            }

            if (ph == peer.public_high && pl == peer.public_low) {
                index2 = i;
                index2_found = true;
            }
        }

        if (!index1_found || !index2_found) {
            return false;
        }

        return allowedConnections[index1][index2];
    }
}
