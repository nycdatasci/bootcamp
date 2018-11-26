from mrjob.job import MRJob
from mrjob.step import MRStep


class MRWordCount(MRJob):

    def mapper(self, _, line):
        for word in line.split():
            yield word, 1

    def reducer(self, key, values):
        yield key, sum(values)

    def steps(self):
        return [
            MRStep(mapper=self.mapper,
                   combiner=self.reducer,
                   reducer=self.reducer)
        ]


if __name__ == '__main__':
    MRWordCount.run()
