class OrderEditorState {
  final String? title;
  final String? imageUrl;
  final String? logoUrl;
  final String? description;
  final String? price;
  final String? address;
  final String? beginTime;
  final String? endTime;
  final String? errorMessage;
  final bool isLoading;
  final bool isInitialized;

  OrderEditorState({
    this.title,
    this.imageUrl,
    this.logoUrl,
    this.description,
    this.price,
    this.address,
    this.beginTime,
    this.endTime,
    this.errorMessage,
    this.isLoading = false,
    this.isInitialized = false,
  });

  OrderEditorState copyWith({
    String? title,
    String? imageUrl,
    String? logoUrl,
    String? description,
    String? price,
    String? address,
    String? beginTime,
    String? endTime,
    String? errorMessage,
    bool? isLoading,
    bool? isInitialized,
  }) {
    return OrderEditorState(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      address: address ?? this.address,
      beginTime: beginTime ?? this.beginTime,
      endTime: endTime ?? this.endTime,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}
