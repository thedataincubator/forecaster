import json
import subprocess
import unittest

class TestSecrets(unittest.TestCase):
    def test_secrets(self):
        out = subprocess.check_output("detect-secrets --scan".split())
        d = json.loads(out.decode('utf-8'))
        # We have a fake API key in here to test the test
        self.assertEqual(len(d["results"]), 1)
