*** Settings ***
Documentation       File with common keyword for works with modal windoww. Win shows up after add product to cart

*** Keywords ***  
Modal Cart :: Check Product in Cart
    Find Element on Page        ${MODAL_CART_WIN_CONFIRM_WIN}   ${MODAL_CART_WIN_CONFIRM_WIN_TEXT}