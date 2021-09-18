// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "./BKMintz_0.sol";
import "./BKMintzNFT_2.sol";
import "https://github.com/0xcert/ethereum-erc721/blob/master/src/contracts/ownership/ownable.sol";

contract newNFT is NFTokenMetadata, Ownable {
 
  constructor() {
      
      
    nftName = "Skarabhaa NFT";
    nftSymbol = "BNFTK";
    nftType = "Punks";
    nftDescription = "A punk like picture by Skarabhaa";
    nftPrice = "0.0001 ETH";
  
      
  }
 
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
 
}
