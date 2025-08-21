{
  rustPlatform,
  lib,
  pkg-config,
  protobuf,
  glib,
  gobject-introspection,
  gtk4,
  gtk4-layer-shell,
  gdk-pixbuf,
  graphene,
  cairo,
  pango,
  poppler,
  wrapGAppsHook,
}:
rustPlatform.buildRustPackage {
  pname = "walker";
  version = "1.0.0-beta";

  src = lib.fileset.toSource {
    root = ../.;
    fileset = lib.fileset.unions [
      ../Cargo.toml
      ../Cargo.lock
      ../src
      ../build.rs
      ../resources
    ];
  };

  cargoHash = "sha256-RvF1k7h1z1KFuHISIFizlifcwr7squfvVu2956iWrDI=";

  nativeBuildInputs = [
    gobject-introspection
    pkg-config
    protobuf
    wrapGAppsHook
  ];

  buildInputs = [
    glib
    gtk4
    gtk4-layer-shell
    gdk-pixbuf
    graphene
    cairo
    pango
    poppler
  ];

  meta = {
    description = "Wayland-native application runner";
    homepage = "https://github.com/abenz1267/walker";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [thshafi170];
    platforms = lib.platforms.linux;
    mainProgram = "walker";
  };
}
