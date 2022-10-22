
import os
import sys
sys.path.append(os.getenv('MY_DS_MODULE_PATH'))

from unittest import TestCase, main
from my_ds import PyDataSet, pyProcessBar

class RectangleTest(TestCase):

    def setUp(self):
        pass

    def test_ds(self):
        a = PyDataSet()
        vv = [{'fid':1, "val":10}, {'fid':2, 'val':20}]
        self.assertEqual(a.size(), 0)
        self.assertEqual(a.append(vv), True)
        self.assertEqual(a.size(), 2)
        self.assertEqual(a.x, vv)

    def test_bar(self):
        
        def update_bar(i, bar):
            bar.n = i+1
            bar.update(0)

        def processBar2(wait_time, total):
            from tqdm import tqdm
            from functools import partial
            with tqdm(total=total) as bar:
                pyProcessBar(wait_time, total, showfunc=partial(update_bar, bar=bar) )
            return 0
        
        self.assertEqual(processBar2(100, 50), 0)

#------- Test Main ----------
if __name__ == '__main__':
    main()