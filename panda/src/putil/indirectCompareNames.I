/**
 * PANDA 3D SOFTWARE
 * Copyright (c) Carnegie Mellon University.  All rights reserved.
 *
 * All use of this software is subject to the terms of the revised BSD
 * license.  You should have received a copy of this license along
 * with this source code in a file named "LICENSE."
 *
 * @file indirectCompareNames.I
 * @author drose
 * @date 2001-02-23
 */

/**
 * Returns true if a sorts before b, false otherwise.
 */
template<class ObjectType>
INLINE bool IndirectCompareNames<ObjectType>::
operator () (const ObjectType *a, const ObjectType *b) const {
  return (a != b && a->get_name() < b->get_name());
}
