

// class MockGetArticles extends Mock implements GetArticles {}
//
// class MockArticleLocalDataSource extends Mock
//     implements ArticleLocalDataSource {}
//
// void main() {
//   group('ArticlesBloc', () {
//     late ArticlesBloc articlesBloc;
//     late MockGetArticles mockGetArticles;
//     late MockArticleLocalDataSource mockLocalDataSource;
//
//     setUp(() {
//       mockGetArticles = MockGetArticles();
//       mockLocalDataSource = MockArticleLocalDataSource();
//       articlesBloc = ArticlesBloc(
//           getArticles: mockGetArticles, localDataSource: mockLocalDataSource);
//     });
//
//     tearDown(() {
//       articlesBloc.close();
//     });
//
//     test('initial state is correct', () {
//       expect(articlesBloc.state, const ArticlesInitial());
//     });
//
//     group('LoadArticlesEvent', () {
//       final articles = [
//         ArticleModel(
//           id: '1',
//           pubDate: '2024-05-10',
//           title: 'Test Article 1',
//           description: 'Description for Test Article 1',
//           image: 'http://example.com/image1.jpg',
//         ),
//         ArticleModel(
//           id: '2',
//           pubDate: '2024-05-11',
//           title: 'Test Article 2',
//           description: 'Description for Test Article 2',
//           image: 'http://example.com/image2.jpg',
//         ),
//       ];
//
//       blocTest<ArticlesBloc, ArticlesState>(
//         'emits [ArticlesLoading, ArticlesLoadSuccess] when LoadArticlesEvent is added',
//         build: () => articlesBloc,
//         act: (bloc) {
//           when(() => mockGetArticles(const GetArticlesParams(1)))
//               .thenAnswer((_) async => Right(articles));
//           bloc.add(const LoadArticlesEvent());
//         },
//         expect: () => [
//           const ArticlesLoading(),
//           ArticlesLoadSuccess(articles: articles),
//         ],
//       );
//     });
//   });
// }
