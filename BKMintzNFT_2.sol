// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "https://github.com/0xcert/ethereum-erc721/blob/master/src/contracts/tokens/nf-token.sol";
import "./BKMintz_0.sol";

/**
 * @dev Optional metadata implementation for ERC-721 non-fungible token standard.
 */
contract NFTokenMetadata is
  NFToken,
  ERC721Metadata
{

  /**
   * @dev A descriptive name for a collection of NFTs.
   */
  string internal nftName;

  /**
   * @dev An abbreviated symbol for NFTokens.
   */
  string internal nftSymbol;
  
  /**
   * @dev An abbreviated type for NFTokens.
   */
  string internal nftType;
  
  /**
   * @dev An abbreviated description for NFTokens.
   */
  string internal nftDescription;

  /**
   * @dev An abbreviated price for NFTokens.
   */
  string internal nftPrice;


  /**
   * @dev Mapping from NFT ID to metadata uri.
   */
  mapping (uint256 => string) internal idToUri;

  /**
   * @notice When implementing this contract don't forget to set nftName and nftSymbol.
   * @dev Contract constructor.
   */
  constructor()
  {
    supportedInterfaces[0x5b5e139f] = true; // ERC721Metadata
  }

  /**
   * @dev Returns a descriptive name for a collection of NFTokens.
   * @return _name Representing name.
   */
  function name()
    external
    override
    view
    returns (string memory _name)
  {
    _name = nftName;
  }

  /**
   * @dev Returns an abbreviated name for NFTokens.
   * @return _symbol Representing symbol.
   */
  function symbol()
    external
    override
    view
    returns (string memory _symbol)
  {
    _symbol = nftSymbol;
  }
  
    /**
   * @dev Returns an abbreviated nftype for NFTokens.
   * @return _nftype Representing type.
   */
  function nftype()
    external
    override
    view
    returns (string memory _nftype)
  {
    _nftype = nftType;
  }
  
    /**
   * @dev Returns an abbreviated description for NFTokens.
   * @return _description Representing description.
   */
  function description()
    external
    override
    view
    returns (string memory _description)
  {
    _description = nftDescription;
  }
  
    /**
   * @dev Returns an abbreviated price for NFTokens.
   * @return _price Representing price.
   */
  function price()
    external
    override
    view
    returns (string memory _price)
  {
    _price = nftPrice;
  }

  /**
   * @dev A distinct URI (RFC 3986) for a given NFT.
   * @param _tokenId Id for which we want uri.
   * @return URI of _tokenId.
   */
  function tokenURI(
    uint256 _tokenId
  )
    external
    override
    view
    validNFToken(_tokenId)
    returns (string memory)
  {
    return idToUri[_tokenId];
  }

  /**
   * @notice This is an internal function which should be called from user-implemented external
   * burn function. Its purpose is to show and properly initialize data structures when using this
   * implementation. Also, note that this burn implementation allows the minter to re-mint a burned
   * NFT.
   * @dev Burns a NFT.
   * @param _tokenId ID of the NFT to be burned.
   */
  function _burn(
    uint256 _tokenId
  )
    internal
    override
    virtual
  {
    super._burn(_tokenId);

    delete idToUri[_tokenId];
  }

  /**
   * @notice This is an internal function which should be called from user-implemented external
   * function. Its purpose is to show and properly initialize data structures when using this
   * implementation.
   * @dev Set a distinct URI (RFC 3986) for a given NFT ID.
   * @param _tokenId Id for which we want URI.
   * @param _uri String representing RFC 3986 URI.
   */
  function _setTokenUri(
    uint256 _tokenId,
    string memory _uri
  )
    internal
    validNFToken(_tokenId)
  {
    idToUri[_tokenId] = _uri;
  }

}
