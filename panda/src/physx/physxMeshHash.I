/**
 * PANDA 3D SOFTWARE
 * Copyright (c) Carnegie Mellon University.  All rights reserved.
 *
 * All use of this software is subject to the terms of the revised BSD
 * license.  You should have received a copy of this license along
 * with this source code in a file named "LICENSE."
 *
 * @file physxMeshHash.I
 * @author enn0x
 * @date 2010-09-13
 */

/**
 *
 */
INLINE PhysxMeshHash::
PhysxMeshHash() {

  _time = 1;
  MeshHashRoot *r = _hashIndex;

  for (int i=0; i < _hashIndexSize; i++) {
    r->first = -1;
    r->timeStamp = 0;
    r++;
  }

  _spacing = 0.25f;
  _invSpacing = 1.0f / _spacing;

}

/**
 *
 */
INLINE PhysxMeshHash::
~PhysxMeshHash() {

}

/**
 *
 */
INLINE int PhysxMeshHash::
hash_function(int xi, int yi, int zi) const {

  unsigned int h = (xi * 92837111)^(yi * 689287499)^(zi * 283923481);
  return h % _hashIndexSize;
}

/**
 *
 */
INLINE void PhysxMeshHash::
cell_coord_of(const NxVec3 &v, int &xi, int &yi, int &zi) const {

  xi = (int)(v.x * _invSpacing); if (v.x < 0.0f) xi--;
  yi = (int)(v.y * _invSpacing); if (v.y < 0.0f) yi--;
  zi = (int)(v.z * _invSpacing); if (v.z < 0.0f) zi--;
}

/**
 *
 */
INLINE NxF32 PhysxMeshHash::
get_grid_spacing() const {

  return 1.0f / _invSpacing;
}
