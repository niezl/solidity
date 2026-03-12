// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
interface IERC721Receiver {

    function onERC721Recived(address operator,address from,address to,uint256 tokenId,bytes calldata data) external returns(bytes4);
    
}
