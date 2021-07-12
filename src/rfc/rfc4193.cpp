/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#include "rfc4193.h"

// static
QList<IPAddressRange> RFC4193::ipv6global() {
  // Allow all addresses except:
  //  fc00::/7 (Unique-local addresses from RFC4193)
  //  fe80::/10 (Link-local addresses)
  //  fec0::/10 (Site-local, but deprecated by RFC3879)
  //  ff00::/8 (Multicast addresses)
  QList<IPAddressRange> list;
  // Allow everything except fc00::/6
  list.append(IPAddressRange("0:0:0:0:0:0:0:0", 1, IPAddressRange::IPv6));
  list.append(IPAddressRange("8000::", 2, IPAddressRange::IPv6));
  list.append(IPAddressRange("c000::", 3, IPAddressRange::IPv6));
  list.append(IPAddressRange("e000::", 4, IPAddressRange::IPv6));
  list.append(IPAddressRange("f000::", 5, IPAddressRange::IPv6));
  list.append(IPAddressRange("f800::", 6, IPAddressRange::IPv6));
  // Also allow fe00::/9 (unassigned range that's almost link-local).
  list.append(IPAddressRange("fe00::", 9, IPAddressRange::IPv6));
  return list;
}
