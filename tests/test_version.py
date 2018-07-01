import unittest

class TestVersion(unittest.TestCase):
    def _test_requirement_file(self, path):
        with open(path, 'r') as fp:
            reqs = fp.readlines()
        for line in reqs:
            self.assertTrue('=' in line)

    def test_secrets(self):
        for req_file in ['conda-', 'dev-', '']:
            file_ = '{}requirements.txt'.format(req_file)
            self._test_requirement_file(file_)
        
