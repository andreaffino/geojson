%global name geojson
%define version 2.5.0
%define unmangled_version 2.5.0
%define release 0

%define __python3 /usr/bin/python3.8

Name:           python38-%{name}
Version:        %{version}
Release:        %{release}
Summary:        Geojson Wrapper
Group:          net
License:        GPL
URL:            http://github.com/Upnext-DragonFly
Vendor:         Upnext
Source0:        %{name}.tar.gz
Prefix:         %{_prefix}
Packager:       Dragonfly
BuildArch:      x86_64
BuildRequires:  python38-devel
Requires:       python38

%description
Geojson Wrapper

%global debug_package %{nil}

%prep
%setup -q

%install
%{__python3} setup.py install --root %{buildroot}

%files
%{python3_sitelib}/*

%changelog
* Thu Sep 08 2022 Dragonfly <dragonfly@upnext.com> - 6.2-4
- RPM packaging
