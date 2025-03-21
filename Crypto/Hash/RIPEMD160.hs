{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TypeFamilies #-}

-- |
-- Module      : Crypto.Hash.RIPEMD160
-- License     : BSD-style
-- Maintainer  : Vincent Hanquez <vincent@snarc.org>
-- Stability   : experimental
-- Portability : unknown
--
-- Module containing the binding functions to work with the
-- RIPEMD160 cryptographic hash.
module Crypto.Hash.RIPEMD160 (RIPEMD160 (..)) where

import Crypto.Hash.Types
import Data.Data
import Data.Word (Word32, Word8)
import Foreign.Ptr (Ptr)

-- | RIPEMD160 cryptographic hash algorithm
data RIPEMD160 = RIPEMD160
    deriving (Show, Data)

instance HashAlgorithm RIPEMD160 where
    type HashBlockSize RIPEMD160 = 64
    type HashDigestSize RIPEMD160 = 20
    type HashInternalContextSize RIPEMD160 = 128
    hashBlockSize _ = 64
    hashDigestSize _ = 20
    hashInternalContextSize _ = 128
    hashInternalInit = c_ripemd160_init
    hashInternalUpdate = c_ripemd160_update
    hashInternalFinalize = c_ripemd160_finalize

foreign import ccall unsafe "crypton_ripemd160_init"
    c_ripemd160_init :: Ptr (Context a) -> IO ()

foreign import ccall "crypton_ripemd160_update"
    c_ripemd160_update :: Ptr (Context a) -> Ptr Word8 -> Word32 -> IO ()

foreign import ccall unsafe "crypton_ripemd160_finalize"
    c_ripemd160_finalize :: Ptr (Context a) -> Ptr (Digest a) -> IO ()
