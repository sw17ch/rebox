-- |This module is quite simple. We expose a
-- few functions which decompose
-- and recompose (unbox/box) different
-- values. Here's an example:
--
-- > data BoxA t = A { unA :: t }
-- > data BoxB t = B { unB :: t }
-- >
-- > a = A 10         -- type is BoxA
-- > b = rebox unA B  -- type is BoxB
--
-- In some cases, such as expression tree
-- decomposition and evaluation, these come
-- in handy.
--
-- These can also be used to combine values
-- in hard-to-reverse ways.
--
-- > rebox2 (*2) (+) 5 10 -- Evaluates to 30

module Data.Rebox (
    rebox, rebox2, rebox3, rebox4, rebox5,
) where

-- | Rebox a single value into a new box.
rebox :: (a -> b) -- ^ Unboxing function
      -> (b -> c) -- ^ Reboxing function
      -> a        -- ^ Box
      -> c
rebox un re box = re (un box)

-- | Rebox two values into a single box.
rebox2 :: (a -> b)
       -> (b -> b -> c)
       -> a -> a
       -> c
rebox2 un re b1 b2 = re (un b1)
                        (un b2)

-- | Rebox three values into a single box.
rebox3 :: (a -> b)
       -> (b -> b -> b -> c)
       -> a -> a -> a
       -> c
rebox3 un re b1 b2 b3 = re (un b1)
                           (un b2)
                           (un b3)

-- | Rebox four values into a single box.
rebox4 :: (a -> b)
       -> (b -> b -> b -> b -> c)
       -> a -> a -> a -> a
       -> c
rebox4 un re b1 b2 b3 b4 = re (un b1)
                              (un b2)
                              (un b3)
                              (un b4)

-- | Rebox five values into a single box.
rebox5 :: (a -> b) -> (b -> b -> b -> b -> b -> c)
       -> a -> a -> a -> a -> a
       -> c
rebox5 un re b1 b2 b3 b4 b5 = re (un b1)
                                 (un b2)
                                 (un b3)
                                 (un b4)
                                 (un b5)
