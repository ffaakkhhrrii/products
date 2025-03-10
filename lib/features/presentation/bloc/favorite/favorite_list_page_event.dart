abstract class FavoriteListPageEvent {
  const FavoriteListPageEvent();
}

class GetAllFavoriteProduct extends FavoriteListPageEvent{
  const GetAllFavoriteProduct();
}

class DeleteAllFavoriteProduct extends FavoriteListPageEvent{
  const DeleteAllFavoriteProduct();
}