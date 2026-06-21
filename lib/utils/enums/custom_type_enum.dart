enum CustomType {
  aerobic,
  arms,
  core,
  legs,
  mobility,
  stretching;

  @override
  toString() {
    switch(this) {
      case CustomType.aerobic:
        return 'AQUECIMENTO';
      case CustomType.arms:
        return 'BRAÇOS';
      case CustomType.core:
        return 'TRONCO';
      case CustomType.legs:
        return 'PERNAS';
      case CustomType.mobility:
        return 'MOBILIDADE';
      case CustomType.stretching:
        return 'ALONGAMENTO';
    }
  }
}