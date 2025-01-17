/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef FEATURELIST_H
#define FEATURELIST_H

#include <QObject>

class FeatureList final : public QObject {
  Q_OBJECT
  Q_DISABLE_COPY_MOVE(FeatureList)

 private:
  Q_PROPERTY(bool startOnBootSupported READ startOnBootSupported CONSTANT)
  Q_PROPERTY(bool localNetworkAccessSupported READ localNetworkAccessSupported
                 CONSTANT)
  Q_PROPERTY(bool protectSelectedAppsSupported READ protectSelectedAppsSupported
                 CONSTANT)
  Q_PROPERTY(bool unsecuredNetworkNotificationSupported READ
                 unsecuredNetworkNotificationSupported CONSTANT)
  Q_PROPERTY(bool captivePortalNotificationSupported READ
                 captivePortalNotificationSupported CONSTANT)
  Q_PROPERTY(bool notificationControlSupported READ notificationControlSupported
                 CONSTANT)
  Q_PROPERTY(bool userDNSSupported READ userDNSSupported CONSTANT)
  Q_PROPERTY(bool authenticationInApp READ authenticationInApp CONSTANT)

 public:
  FeatureList() = default;
  ~FeatureList() = default;

  static FeatureList* instance();

  bool startOnBootSupported() const;

  bool protectSelectedAppsSupported() const;

  bool localNetworkAccessSupported() const;

  bool captivePortalNotificationSupported() const;

  bool unsecuredNetworkNotificationSupported() const;

  bool notificationControlSupported() const;

  bool userDNSSupported() const;

  bool authenticationInApp() const;

  // some platforms support the authentication in app, but not the account
  // creation.
  bool accountCreationInAppSupported() const;

  bool inAppPurchaseSupported() const;
};

#endif  // FEATURELIST_H
