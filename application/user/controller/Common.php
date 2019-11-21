<?php
namespace app\user\controller;
use Libs\Path;
use think\Controller;
use think\Input;
use think\Route;

class Common extends Controller {
	/**
	 * @var bool
	 */
	protected $_toHtml = false;

	protected $userInfo;

	protected $_start = 0;

	protected $_system;

	protected $_pageSize = 10;

	public function _initialize() {
		parent::_initialize();
		/* if (!session('user.user_id')) {
			            $this->redirect('login/index');
		*/

		#session('user.user_id', null);

		// 计算分页偏移量
		$page = (int) input('page');
		$pageSize = (int) input('pageSize');
		if ($pageSize) {
			$this->_pageSize = $pageSize;
		}

		if ($page > 1000) {
			$page = 1000;
		}

		if ($this->_pageSize > 1000) {
			$this->_pageSize = 1000;
		}

		if ($page <= 1) {
			$this->_start = 0;
		} else {
			$this->_start = ($page - 1) * $this->_pageSize;
		}
		$this->_system = db('system')->where('id', 1)->find();
		$this->userInfo = db('users')->where(['user_id' => session('user.user_id')])->find();
		$this->assign('userInfo', $this->userInfo);
		$this->assign('version', '20180806');
		$this->assign('title', 'Our Ecdogical Communit');
		$this->assign('wboos_hash', \Libs\Common::hash());
	}

	public function _empty() {
		return $this->error('空操作，返回上次访问页面中...');
	}

	/**
	 * @param array $params
	 * @return array|string
	 */
	public function ajax(array $params) {
		if (empty($params['status']) || empty($params['msg'])) {
			return 'miss params: status and msg';
		}

		if (version_compare(PHP_VERSION, '5.4') > 0) {
			$params = json_encode($params, JSON_UNESCAPED_UNICODE);
		} else {
			$params = json_encode($params);
		}

		return $params;
	}

	/**
	 * @return $this
	 */
	public function toHtml($isToHtml = true) {
		$this->_toHtml = $isToHtml;
		return $this;
	}

	/**
	 * 重写视图获取器
	 *
	 * @param string $template
	 * @param array $vars
	 * @param array $replace
	 * @param array $config
	 * @return mixed
	 */
	protected function fetch($template = '', $vars = [], $replace = [], $config = []) {
		$html = parent::fetch($template, $vars, $replace, $config);

		/**
		 * 把页面生成静态HTML
		 */
		if ($this->_toHtml && OEC_STATIC_GENERATOR) {
			$uri = '';
			if (isset($_SERVER['QUERY_STRING'])) {
				$uri = $_SERVER['QUERY_STRING'];
			} else if (isset($_SERVER['REQUEST_URI'])) {
				$uri = $_SERVER['REQUEST_URI'];
			}

			$routeParams = Route::parseUrl($uri);
			if (isset($routeParams[$routeParams['type']])) {
				$routeParams = $routeParams[$routeParams['type']];
			}

			$fileName = array_pop($routeParams);

			$phpFile = $routeParams[count($routeParams) - 1];
			$filePath = __DIR__ . DIRECTORY_SEPARATOR . ucfirst($phpFile) . '.php';
			// 如果对应的动态文件不存在时直接返回
			if (!is_file($filePath)) {
				return $html;
			}

			$routeParams = implode(DIRECTORY_SEPARATOR, $routeParams);
			$path = (OEC_PUBILC_PATH . DIRECTORY_SEPARATOR . $routeParams);
			#var_dump($path, is_file($filePath), $phpFile, $routeParams);exit;

			// 检测目录是否存在，如果不存在则创建
			$isWritePath = Path::checkDir($path);
			if ($isWritePath) {
				$path = realpath($path);
				if (empty($fileName)) {
					$fileName = 'index.html';
				} else {
					$fileName = substr($fileName, 0, strpos($fileName, '.html') + 5);
				}

				#var_dump($path . DIRECTORY_SEPARATOR . $fileName);exit;
				file_put_contents($path . DIRECTORY_SEPARATOR . $fileName, $html);
				chmod($path . DIRECTORY_SEPARATOR . $fileName, 0777);
			}
		}

		return $html;
	}
}