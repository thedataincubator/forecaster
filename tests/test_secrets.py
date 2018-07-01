import json
import subprocess
import unittest

class TestSecrets(unittest.TestCase):
    def test_secrets(self):
        out = subprocess.check_output("detect-secrets --scan".split())
        d = json.loads(out.decode('utf-8'))
        # We have a fake API key in here to test the test, also heroku secret
        filtered = {k:v for k, v in d['results'].items() if k!= '.travis.yml'}
        self.assertEqual(len(filtered), 1)
