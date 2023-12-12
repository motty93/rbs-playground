D = Steep::Diagnostic

target :app do
  check "app"
  signature "sig"

  # 型検査はせずに補完強化用途でのみSteepを利用する
  configure_code_diagnostics(D::Ruby.silent)
end
