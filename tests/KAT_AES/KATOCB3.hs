{-# LANGUAGE OverloadedStrings #-}

module KAT_AES.KATOCB3 where

import qualified Data.ByteString as B
import Data.ByteString.Char8 ()

-- (key, iv, aad, input, out, taglen, tag)
type KATOCB3 =
    ( B.ByteString
    , B.ByteString
    , B.ByteString
    , B.ByteString
    , B.ByteString
    , Int
    , B.ByteString
    )

key1 = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
nonce1 = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b"

vectors_aes128_enc :: [KATOCB3]
vectors_aes128_enc =
    [
        ( {-key = -} key1
        , {-iv = -} nonce1
        , {-aad = -} ""
        , {-input = -} ""
        , {-out = -} ""
        , {-taglen = -} 16
        , {-tag = -} "\x19\x7b\x9c\x3c\x44\x1d\x3c\x83\xea\xfb\x2b\xef\x63\x3b\x91\x82"
        )
    ,
        ( key1
        , nonce1
        , "\x00\x01\x02\x03\x04\x05\x06\x07"
        , "\x00\x01\x02\x03\x04\x05\x06\x07"
        , "\x92\xb6\x57\x13\x0a\x74\xb8\x5a"
        , 16
        , "\x16\xdc\x76\xa4\x6d\x47\xe1\xea\xd5\x37\x20\x9e\x8a\x96\xd1\x4e"
        )
    ,
        ( key1
        , nonce1
        , "\x00\x01\x02\x03\x04\x05\x06\x07"
        , ""
        , ""
        , 16
        , "\x98\xb9\x15\x52\xc8\xc0\x09\x18\x50\x44\xe3\x0a\x6e\xb2\xfe\x21"
        )
    ,
        ( key1
        , nonce1
        , ""
        , "\x00\x01\x02\x03\x04\x05\x06\x07"
        , "\x92\xb6\x57\x13\x0a\x74\xb8\x5a"
        , 16
        , "\x97\x1e\xff\xca\xe1\x9a\xd4\x71\x6f\x88\xe8\x7b\x87\x1f\xbe\xed"
        )
    ,
        ( key1
        , nonce1
        , "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
        , "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
        , "\xbe\xa5\xe8\x79\x8d\xbe\x71\x10\x03\x1c\x14\x4d\xa0\xb2\x61\x22"
        , 16
        , "\x77\x6c\x99\x24\xd6\x72\x3a\x1f\xc4\x52\x45\x32\xac\x3e\x5b\xeb"
        )
    ]
