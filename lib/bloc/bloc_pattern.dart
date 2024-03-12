import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api/domain/Repository/news_repository.dart';

//Этот класс представляет абстрактное событие в BLoC.
// Он является абстрактным и наследуется от Equatable,
// что обеспечивает правильное сравнение объектов для событий

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}
//корректное событие. FetchFetchChannelHeadlinesEvent для запроса новостей на главной странице
class FetchChannelHeadlinesEvent extends NewsEvent {
  final String channelName;

  const FetchChannelHeadlinesEvent(this.channelName);

  @override
  List<Object> get props => [channelName];
}
//корректное событие. FetchCategoriesNewsEvent для запроса новостей на экране по категориям
class FetchCategoriesNewsEvent extends NewsEvent {
  final String category;

  const FetchCategoriesNewsEvent(this.category);

  @override
  List<Object> get props => [category];
  //props возвращает список свойств объекта для корректного сравнения
}

//Этот класс представляет абстрактное состояние в BLoC
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

//представляет BLoC начальное состояние
class NewsInitialState extends NewsState {}

//представляет BLoC состояние загрузки
class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final dynamic data;

  const NewsLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

//представляет BLoC состояние с ошибкой
class NewsErrorState extends NewsState {
  final String error;

  const NewsErrorState(this.error);

  @override
  List<Object> get props => [error];
}

// BLoC
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository = NewsRepository();

  NewsBloc() : super(NewsInitialState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchChannelHeadlinesEvent) {

      //Выпуск состояния NewsLoadingState, чтобы UI мог показать индикатор загрузки
      yield NewsLoadingState();
      try {
        final data = await repository.fetchNewChannelHeadlinesApi(event.channelName);
        yield NewsLoadedState(data);
      } catch (e) {
        yield const NewsErrorState("Ошибка при получении заголовков каналов.");
      }
    } else if (event is FetchCategoriesNewsEvent) {

      //Выпуск состояния NewsLoadingState, чтобы UI мог показать индикатор загрузки
      yield NewsLoadingState();
      try {
        final data = await repository.fetchCategoriesNewsApi(event.category);
        yield NewsLoadedState(data);
      } catch (e) {
        yield const NewsErrorState("Ошибка при получении категорий новостей.");
      }
    }
  }
}